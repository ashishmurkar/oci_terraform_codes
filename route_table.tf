resource "oci_core_route_table" "public_rt" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id         = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6ia2eqnnpucq35xuvsvd5grch2u5zab7ojztjlz3g5lgoaa"

  display_name = "flip_public_rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "ocid1.internetgateway.oc1.ap-mumbai-1.aaaaaaaazern6grbohf7uedc7poh3w6kirjuztfbemehmvlqfdp6yyl22hgq"
  }
}

resource "oci_core_route_table" "private_rt" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id         = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6ia2eqnnpucq35xuvsvd5grch2u5zab7ojztjlz3g5lgoaa"

  display_name = "flip_private_rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = "ocid1.natgateway.oc1.ap-mumbai-1.aaaaaaaajdk3fjbw6l6gmctvsme27j2u6lamfqhrn6acwuvhp3pxx4s4s7oa"
  }
}
