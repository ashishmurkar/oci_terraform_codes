resource "oci_identity_compartment" "Flip_Compartment" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaatbnralswjtkdmcrneahdhwiwtvi5h2p7fe6ps4sf57zhpfp55aka"
  name           = "Flip_Compartment"
  description    = "Compartment for Flip project"
  
  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
    }
  }
