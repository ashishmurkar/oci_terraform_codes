resource "oci_core_subnet" "flip_pub_subnet" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id         = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6ia2eqnnpucq35xuvsvd5grch2u5zab7ojztjlz3g5lgoaa"

  display_name   = "flip_public_subnet"
  cidr_block     = "10.0.2.0/29"

  route_table_id = "ocid1.routetable.oc1.ap-mumbai-1.aaaaaaaajjboduky4s5eswklkoinaaq6txvznznudupmfz7rv3rwcq5qghvq"
  security_list_ids = [
    oci_core_security_list.public_sl.id
  ]
  prohibit_public_ip_on_vnic = false
}

resource "oci_core_subnet" "flip_priv_subnet" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id         = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6ia2eqnnpucq35xuvsvd5grch2u5zab7ojztjlz3g5lgoaa"

  display_name   = "flip_private_subnet"
  cidr_block     = "10.0.2.8/29"

  route_table_id = oci_core_route_table.private_rt.id
  security_list_ids = [
    oci_core_security_list.flip_private_sl.id
  ]

  prohibit_public_ip_on_vnic = true
}