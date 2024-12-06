// TODO license, other bindings

[CCode (cheader_filename = "vala-backend.h")]
namespace Vala.Backend {
    [CCode (cname = "linemap_t", has_type_id = false)]
    public struct Linemap {
        [CCode (cname = "vala_be_linemap_init")]
        public Linemap ();

        [CCode (cname = "vala_be_linemap_instance")]
        public static Linemap instance;

        [CCode (cname = "vala_be_linemap_start_file")]
        public void start_file (string file_name, uint line_begin);
        [CCode (cname = "vala_be_linemap_start_line")]
        public void start_line (uint line_number, uint line_size);
        [CCode (cname = "vala_be_linemap_stop")]
        public void stop ();

        [CCode (cname = "vala_be_linemap_get_location")]
        public Location get_location (uint column, uint length = 0);
        public string to_string (Location location);

        public static Location get_predeclared_location ();
        public static Location get_unknown_location ();
        public static bool is_predeclared (Location location);
        public static bool is_unknown (Location location);

        public static string location_to_string (Location location);
        public static string location_to_file (Location location);
        public static uint location_to_line (Location location);
    }
}
