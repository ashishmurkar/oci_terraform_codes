resource "oci_core_security_list" "public_sl" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id         = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6ia2eqnnpucq35xuvsvd5grch2u5zab7ojztjlz3g5lgoaa"

  display_name = "flip_public_sl"

  # HTTP
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 80
      max = 80
    }
  }

  # HTTPS
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 443
      max = 443
    }
  }

  # SSH (LAB ONLY)
  ingress_security_rules {
    protocol = "6"
    source   = "0.0.0.0/0"

    tcp_options {
      min = 22
      max = 22
    }
  }

  # Allow all outbound
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}


resource "oci_core_security_list" "flip_private_sl" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id         = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6ia2eqnnpucq35xuvsvd5grch2u5zab7ojztjlz3g5lgoaa"

  display_name = "flip_private_sl"

  # Allow all inbound from the public subnet CIDR (for app server communication)
  ingress_security_rules {
    protocol = "all"
    source   = "10.0.2.0/29"
  }

  # Allow all outbound (for NAT/Internet access from private subnet)
  egress_security_rules {
    protocol    = "all"
    destination = "0.0.0.0/0"
  }
}