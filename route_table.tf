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

resource "oci_core_route_table" "hub_pub_subnet_rt" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaks4kmn7u37x36bo2v2fhstp4bftgdjrecinpzvckqnxdkbbe6ubq"
  vcn_id         = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6iafutoaopywr2lc237xvtdd7a6q5qhce6l6feurxzlkn2a"
  display_name   = "hub_pub_subnet_RT"


# Existing Internet Route
route_rules {
  destination       = "0.0.0.0/0"
  destination_type  = "CIDR_BLOCK"
  network_entity_id = "ocid1.internetgateway.oc1.ap-mumbai-1.aaaaaaaav7cupdzu2fgvyuux6q3xcawdobi4lc5ovfvxtpavdje7skdzc2sq"
  description       = "Connectivity to internet"
}

# Hub → Spoke App Subnet via DRG
route_rules {
  destination       = "10.0.2.0/29"
  destination_type  = "CIDR_BLOCK"
  network_entity_id = oci_core_drg.hub_to_spoke_drg.id
  description       = "allowing traffic from hub_pub_subnet to spoke app_sub via DRG"
}

}