// TODO license, other bindings

[CCode (cheader_filename = "vala-backend.h")]
namespace Vala.Backend {
    [CCode (cname = "vala_be_inform_at")]
    public static void inform_at (Location location, string inform_message);

    [CCode (cname = "vala_be_error_at")]
    public static void error_at (Location location, string error_message);

    [CCode (cname = "vala_be_warning_at")]
    public static void warning_at (Location location, string warning_message);

    [CCode (cname = "vala_be_fatal_error_at")]
    public static void fatal_error_at (Location location, string fatal_message);

    [CCode (cname = "vala_be_assert")]
    public static void assert (bool value);
}
