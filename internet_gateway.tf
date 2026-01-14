
resource "oci_core_internet_gateway" "app_internet_gateway" {
	compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
	vcn_id         = oci_core_vcn.spoke_vcn.id
	display_name   = "app_internet_gateway"

	defined_tags = {
		"FLIPKART-TAGS.Environment" = "Prod"
	}

}

# NOTE: Add a route rule in your route table that points to this IG using
# `network_entity_id = oci_core_internet_gateway.ig.id` for outbound 0.0.0.0/0.

