resource "oci_core_subnet" "app_sub" {
  compartment_id            = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id                    = oci_core_vcn.spoke_vcn.id
  cidr_block                = "10.0.2.0/29"
  display_name              = "app_sub"
  dns_label                 = "appsub"
  route_table_id            = oci_core_route_table.app_rt.id
  security_list_ids         = [oci_core_security_list.app_sl.id]
  prohibit_public_ip_on_vnic = true

  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
  }
}