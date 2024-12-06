/* valafrontend.vala
 *
 * Copyright (C) 2024 Hakan Candar
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.

 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.

 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA
 *
 * Author:
 *      Hakan Candar <hakan@candar.tr>
 */

using GLib;

public class Vala.Frontend {

	CodeContext context;

	public Frontend () {
		context = new CodeContext ();
		CodeContext.push (context);
	}

	public void parse_input_files (string[] filenames, bool only_check_syntax, bool ignored) {
		stdout.printf ("input count: %d\n", filenames.length);

		stdout.printf ("foreach add source\n");
		foreach (string filename in filenames) {
			context.add_source_filename (filename, false, true);
		}

		var list_sources = true;

		stdout.printf ("foreach list source\n");
                if (list_sources) {
                        foreach (SourceFile file in context.get_source_files ()) {
                                print ("%s\n", file.filename);
                        }
                }

		stdout.printf ("declare builtins\n");
		Builtins.declare_defaults (context.root);

		stdout.printf ("parser\n");
		var parser = new Parser ();
		parser.parse (context);

		stdout.printf ("context check\n");
		context.check ();

		bool fatal_warnings = false;

                if (context.report.get_errors () > 0 || (fatal_warnings && context.report.get_warnings () > 0)) {
                        Vala.Backend.assert (false);
			return;
                }

	}

}
