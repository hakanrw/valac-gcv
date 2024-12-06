// TODO license, other bindings

[CCode (cheader_filename = "vala-backend.h")]
namespace Vala.Backend {
    [SimpleType]
    [CCode (cname = "Location", has_type_id = false)]
    public struct Location : uint {
    }
}
