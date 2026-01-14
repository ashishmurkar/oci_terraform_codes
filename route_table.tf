resource "oci_core_route_table" "app_rt" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id         = oci_core_vcn.spoke_vcn.id
  display_name   = "app_rt"

  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.app_internet_gateway.id
    description       = "Route internet-bound traffic to IG"
  }

  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
  }
}