resource "oci_core_internet_gateway" "spoke_igw" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaw7nvo6iigpp447ffwjjga5kfknm3sa6wrgbmhhdkgufsfsob7nua"
  vcn_id         = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6ia2eqnnpucq35xuvsvd5grch2u5zab7ojztjlz3g5lgoaa"
  display_name   = "flip_igw"
  enabled        = true

  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
  }

}