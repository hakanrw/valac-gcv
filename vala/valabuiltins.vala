/* valasbuiltins.vala
 *
 * Copyright (C) 2024  Hakan Candar
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

/**
 * Helper class for declaring builtin types.
 */
public class Vala.Builtins {

	/**
	 * Declare symbol in the given namespace and return it back.
	 */
	public static Symbol declare (Symbol symbol, Namespace namespace) {
		namespace.add_struct ((Struct) symbol); // FIXME: Struct, Class, differing symbol additions
		return symbol;
	}

	/**
	 * Declare default builtins in the given namespace.
	 */
	public static void declare_defaults (Namespace n) {
		Struct bool_sym   = (Struct) declare (create_boolean_symbol ("bool"), n);
		Struct char_sym   = (Struct) declare (create_integer_symbol ("char"), n);
		Struct uchar_sym  = (Struct) declare (create_integer_symbol ("uchar"), n);
		Struct int_sym    = (Struct) declare (create_integer_symbol ("int"), n);
		Struct uint_sym   = (Struct) declare (create_integer_symbol ("uint"), n);
		Struct short_sym  = (Struct) declare (create_integer_symbol ("short"), n);
		Struct ushort_sym = (Struct) declare (create_integer_symbol ("ushort"), n);
		Struct long_sym   = (Struct) declare (create_integer_symbol ("long"), n);
		Struct ulong_sym  = (Struct) declare (create_integer_symbol ("ulong"), n);
		Struct int8_sym   = (Struct) declare (create_integer_symbol ("int8"), n);
		Struct uint8_sym  = (Struct) declare (create_integer_symbol ("uint8"), n);
		Struct int16_sym  = (Struct) declare (create_integer_symbol ("int16"), n);
		Struct uint16_sym = (Struct) declare (create_integer_symbol ("uint16"), n);
		Struct int32_sym  = (Struct) declare (create_integer_symbol ("int32"), n);
		Struct uint32_sym = (Struct) declare (create_integer_symbol ("uint32"), n);
		Struct int64_sym  = (Struct) declare (create_integer_symbol ("int64"), n);
		Struct uint64_sym = (Struct) declare (create_integer_symbol ("uint64"), n);
		Struct float_sym  = (Struct) declare (create_floating_symbol ("float"), n);
		Struct double_sym = (Struct) declare (create_floating_symbol ("double"), n);

//		Struct test_struct = (Struct) declare (
//			create_struct_symbol ("Test",
//				new Field[] {
//					new Field ("echar",
//						new UnresolvedType.from_symbol (new UnresolvedSymbol (null, "char")), null
//					),
//					new Field ("eint",
//						new UnresolvedType.from_symbol (new UnresolvedSymbol (null, "int")), null
//					),
//					new Field ("efloat",
//						new UnresolvedType.from_symbol (new UnresolvedSymbol (null, "float")), null
//					)
//				}
//			),
//			n
//		);
	}
	
	/**
	 * Create a builtin integer symbol with the given name.
	 */
	public static Struct create_integer_symbol (string name) {
		Struct builtin = create_struct_symbol (name);
		builtin.add_attribute (new Attribute ("IntegerType"));
		return builtin;
	}

	/**
	 * Create a builtin floating symbol with the given name.
	 */
	public static Struct create_floating_symbol (string name) {
		Struct builtin = create_struct_symbol (name);
		builtin.add_attribute (new Attribute ("FloatingType"));
		return builtin;
	}

	/**
	 * Create a builtin boolean symbol with the given name.
	 */
	public static Struct create_boolean_symbol (string name) {
		Struct builtin = create_struct_symbol (name);
		builtin.add_attribute (new Attribute ("BooleanType"));
		return builtin;
	}


	/**
	 * Create a builtin struct with the given name and fields.
	 */
	public static Struct create_struct_symbol (string name, Field[]? fields = null) {
		Struct builtin = new Struct (name);

		if (fields != null) {
			foreach (Field field in fields) {
				builtin.add_field (field);
			} 
		}

		return builtin;
	}
}
