resource "oci_core_drg" "hub_to_spoke_drg" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaaks4kmn7u37x36bo2v2fhstp4bftgdjrecinpzvckqnxdkbbe6ubq"
  display_name   = "hub_to_spoke_drg"

  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
  }
}

resource "oci_core_drg_attachment" "attach_to_hub" {
  drg_id = oci_core_drg.hub_to_spoke_drg.id
  vcn_id = "ocid1.vcn.oc1.ap-mumbai-1.amaaaaaagyisp6iafutoaopywr2lc237xvtdd7a6q5qhce6l6feurxzlkn2a"
  display_name = "attach_to_hub"
  
  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
}
}

resource "oci_core_drg_attachment" "attach_to_spoke" {
  drg_id = oci_core_drg.hub_to_spoke_drg.id
  vcn_id = oci_core_vcn.spoke_vcn.id
  display_name = "attach_to_spoke"

  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
  }
}