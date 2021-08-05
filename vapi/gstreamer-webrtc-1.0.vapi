/* gstreamer-webrtc-1.0.vapi generated by vapigen, do not modify. */

[CCode (cprefix = "Gst", gir_namespace = "GstWebRTC", gir_version = "1.0", lower_case_cprefix = "gst_")]
namespace Gst {
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", lower_case_csuffix = "webrtc_dtls_transport", type_id = "gst_webrtc_dtls_transport_get_type ()")]
	public class WebRTCDTLSTransport : Gst.Object {
		[CCode (has_construct_function = false)]
		protected WebRTCDTLSTransport ();
		[NoAccessorMethod]
		public string certificate { owned get; set; }
		[NoAccessorMethod]
		public bool client { get; set; }
		[NoAccessorMethod]
		public string remote_certificate { owned get; }
		[NoAccessorMethod]
		public uint session_id { get; construct; }
		[NoAccessorMethod]
		public Gst.WebRTCDTLSTransportState state { get; }
		[NoAccessorMethod]
		public Gst.WebRTCICETransport transport { owned get; }
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", lower_case_csuffix = "webrtc_data_channel", type_id = "gst_webrtc_data_channel_get_type ()")]
	[Version (since = "1.18")]
	public abstract class WebRTCDataChannel : GLib.Object {
		[CCode (has_construct_function = false)]
		protected WebRTCDataChannel ();
		[NoAccessorMethod]
		public uint64 buffered_amount { get; }
		[NoAccessorMethod]
		public uint64 buffered_amount_low_threshold { get; set; }
		[NoAccessorMethod]
		public int id { get; construct; }
		[NoAccessorMethod]
		public string label { owned get; construct; }
		[NoAccessorMethod]
		public int max_packet_lifetime { get; construct; }
		[NoAccessorMethod]
		public int max_retransmits { get; construct; }
		[NoAccessorMethod]
		public bool negotiated { get; construct; }
		[NoAccessorMethod]
		public bool ordered { get; construct; }
		[NoAccessorMethod]
		public Gst.WebRTCPriorityType priority { get; construct; }
		[NoAccessorMethod]
		public string protocol { owned get; construct; }
		[NoAccessorMethod]
		public Gst.WebRTCDataChannelState ready_state { get; }
		[HasEmitter]
		public signal void close ();
		public signal void on_buffered_amount_low ();
		public signal void on_close ();
		public signal void on_error (GLib.Error error);
		public signal void on_message_data (GLib.Bytes? data);
		public signal void on_message_string (string? data);
		public signal void on_open ();
		[HasEmitter]
		public signal void send_data (GLib.Bytes? data);
		[HasEmitter]
		public signal void send_string (string? str);
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", lower_case_csuffix = "webrtc_ice_transport", type_id = "gst_webrtc_ice_transport_get_type ()")]
	public abstract class WebRTCICETransport : Gst.Object {
		[CCode (has_construct_function = false)]
		protected WebRTCICETransport ();
		[NoAccessorMethod]
		public Gst.WebRTCICEComponent component { get; construct; }
		[NoAccessorMethod]
		public Gst.WebRTCICEGatheringState gathering_state { get; }
		[NoAccessorMethod]
		public Gst.WebRTCICEConnectionState state { get; }
		public signal void on_new_candidate (string object);
		public signal void on_selected_candidate_pair_change ();
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", lower_case_csuffix = "webrtc_rtp_receiver", type_id = "gst_webrtc_rtp_receiver_get_type ()")]
	public class WebRTCRTPReceiver : Gst.Object {
		[CCode (has_construct_function = false)]
		protected WebRTCRTPReceiver ();
		[NoAccessorMethod]
		[Version (since = "1.20")]
		public Gst.WebRTCDTLSTransport transport { owned get; }
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", lower_case_csuffix = "webrtc_rtp_sender", type_id = "gst_webrtc_rtp_sender_get_type ()")]
	public class WebRTCRTPSender : Gst.Object {
		[CCode (has_construct_function = false)]
		protected WebRTCRTPSender ();
		[Version (since = "1.20")]
		public void set_priority (Gst.WebRTCPriorityType priority);
		[NoAccessorMethod]
		[Version (since = "1.20")]
		public Gst.WebRTCPriorityType priority { get; set; }
		[NoAccessorMethod]
		[Version (since = "1.20")]
		public Gst.WebRTCDTLSTransport transport { owned get; }
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", lower_case_csuffix = "webrtc_rtp_transceiver", type_id = "gst_webrtc_rtp_transceiver_get_type ()")]
	public abstract class WebRTCRTPTransceiver : Gst.Object {
		[CCode (has_construct_function = false)]
		protected WebRTCRTPTransceiver ();
		[NoAccessorMethod]
		[Version (since = "1.20")]
		public Gst.Caps codec_preferences { owned get; set; }
		[NoAccessorMethod]
		[Version (since = "1.20")]
		public Gst.WebRTCRTPTransceiverDirection current_direction { get; }
		[NoAccessorMethod]
		[Version (since = "1.18")]
		public Gst.WebRTCRTPTransceiverDirection direction { get; set; }
		[NoAccessorMethod]
		[Version (since = "1.20")]
		public Gst.WebRTCKind kind { get; }
		[NoAccessorMethod]
		[Version (since = "1.20")]
		public string mid { owned get; }
		[NoAccessorMethod]
		public uint mlineindex { get; construct; }
		[NoAccessorMethod]
		public Gst.WebRTCRTPReceiver receiver { owned get; construct; }
		[NoAccessorMethod]
		public Gst.WebRTCRTPSender sender { owned get; construct; }
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", copy_function = "g_boxed_copy", free_function = "g_boxed_free", lower_case_csuffix = "webrtc_session_description", type_id = "gst_webrtc_session_description_get_type ()")]
	[Compact]
	public class WebRTCSessionDescription {
		public weak Gst.SDP.Message sdp;
		public Gst.WebRTCSDPType type;
		[CCode (has_construct_function = false)]
		public WebRTCSessionDescription (Gst.WebRTCSDPType type, owned Gst.SDP.Message sdp);
		public Gst.WebRTCSessionDescription copy ();
		[DestroysInstance]
		public void free ();
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_BUNDLE_POLICY_", type_id = "gst_webrtc_bundle_policy_get_type ()")]
	[Version (since = "1.16")]
	public enum WebRTCBundlePolicy {
		NONE,
		BALANCED,
		MAX_COMPAT,
		MAX_BUNDLE
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_DTLS_SETUP_", type_id = "gst_webrtc_dtls_setup_get_type ()")]
	public enum WebRTCDTLSSetup {
		NONE,
		ACTPASS,
		ACTIVE,
		PASSIVE
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_DTLS_TRANSPORT_STATE_", type_id = "gst_webrtc_dtls_transport_state_get_type ()")]
	public enum WebRTCDTLSTransportState {
		NEW,
		CLOSED,
		FAILED,
		CONNECTING,
		CONNECTED
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_DATA_CHANNEL_STATE_", type_id = "gst_webrtc_data_channel_state_get_type ()")]
	[Version (since = "1.16")]
	public enum WebRTCDataChannelState {
		NEW,
		CONNECTING,
		OPEN,
		CLOSING,
		CLOSED
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_FEC_TYPE_", type_id = "gst_webrtc_fec_type_get_type ()")]
	[Version (since = "1.14.1")]
	public enum WebRTCFECType {
		NONE,
		ULP_RED
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_ICE_COMPONENT_", type_id = "gst_webrtc_ice_component_get_type ()")]
	public enum WebRTCICEComponent {
		RTP,
		RTCP
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_ICE_CONNECTION_STATE_", type_id = "gst_webrtc_ice_connection_state_get_type ()")]
	public enum WebRTCICEConnectionState {
		NEW,
		CHECKING,
		CONNECTED,
		COMPLETED,
		FAILED,
		DISCONNECTED,
		CLOSED
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_ICE_GATHERING_STATE_", type_id = "gst_webrtc_ice_gathering_state_get_type ()")]
	public enum WebRTCICEGatheringState {
		NEW,
		GATHERING,
		COMPLETE
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_ICE_ROLE_", type_id = "gst_webrtc_ice_role_get_type ()")]
	public enum WebRTCICERole {
		CONTROLLED,
		CONTROLLING
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_ICE_TRANSPORT_POLICY_", type_id = "gst_webrtc_ice_transport_policy_get_type ()")]
	[Version (since = "1.16")]
	public enum WebRTCICETransportPolicy {
		ALL,
		RELAY
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_KIND_", type_id = "gst_webrtc_kind_get_type ()")]
	[Version (since = "1.20")]
	public enum WebRTCKind {
		UNKNOWN,
		AUDIO,
		VIDEO
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_PEER_CONNECTION_STATE_", type_id = "gst_webrtc_peer_connection_state_get_type ()")]
	public enum WebRTCPeerConnectionState {
		NEW,
		CONNECTING,
		CONNECTED,
		DISCONNECTED,
		FAILED,
		CLOSED
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_PRIORITY_TYPE_", type_id = "gst_webrtc_priority_type_get_type ()")]
	[Version (since = "1.16")]
	public enum WebRTCPriorityType {
		VERY_LOW,
		LOW,
		MEDIUM,
		HIGH
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_RTP_TRANSCEIVER_DIRECTION_", type_id = "gst_webrtc_rtp_transceiver_direction_get_type ()")]
	public enum WebRTCRTPTransceiverDirection {
		NONE,
		INACTIVE,
		SENDONLY,
		RECVONLY,
		SENDRECV
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_SCTP_TRANSPORT_STATE_", type_id = "gst_webrtc_sctp_transport_state_get_type ()")]
	[Version (since = "1.16")]
	public enum WebRTCSCTPTransportState {
		NEW,
		CONNECTING,
		CONNECTED,
		CLOSED
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_SDP_TYPE_", type_id = "gst_webrtc_sdp_type_get_type ()")]
	public enum WebRTCSDPType {
		OFFER,
		PRANSWER,
		ANSWER,
		ROLLBACK;
		[CCode (cname = "gst_webrtc_sdp_type_to_string")]
		public unowned string to_string ();
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_SIGNALING_STATE_", type_id = "gst_webrtc_signaling_state_get_type ()")]
	public enum WebRTCSignalingState {
		STABLE,
		CLOSED,
		HAVE_LOCAL_OFFER,
		HAVE_REMOTE_OFFER,
		HAVE_LOCAL_PRANSWER,
		HAVE_REMOTE_PRANSWER
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h", cprefix = "GST_WEBRTC_STATS_", type_id = "gst_webrtc_stats_type_get_type ()")]
	public enum WebRTCStatsType {
		CODEC,
		INBOUND_RTP,
		OUTBOUND_RTP,
		REMOTE_INBOUND_RTP,
		REMOTE_OUTBOUND_RTP,
		CSRC,
		PEER_CONNECTION,
		DATA_CHANNEL,
		STREAM,
		TRANSPORT,
		CANDIDATE_PAIR,
		LOCAL_CANDIDATE,
		REMOTE_CANDIDATE,
		CERTIFICATE
	}
	[CCode (cheader_filename = "gst/webrtc/webrtc.h")]
	[Version (replacement = "WebRTCSDPType.to_string")]
	public static unowned string webrtc_sdp_type_to_string (Gst.WebRTCSDPType type);
}
