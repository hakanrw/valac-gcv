// TODO license, other bindings

[CCode (cheader_filename = "vala-backend.h")]
namespace Vala.Backend {
    [CCode (cname = "vala_get_linemap")]
    public Linemap get_linemap ();
}
