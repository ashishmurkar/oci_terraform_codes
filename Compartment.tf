resource "oci_identity_compartment" "Flip_Compartment" {
  compartment_id = "ocid1.tenancy.oc1..aaaaaaaatbnralswjtkdmcrneahdhwiwtvi5h2p7fe6ps4sf57zhpfp55aka"
  name           = "Flip_Compartment"
  description    = "Compartment for Flip project"
  
  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
    }
  }


resource "oci_identity_compartment" "Flip_Network_Compartment" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaagsgye2ft6ssyas7uvsq7ohgehqbo7lstsgvy27chjqpbkuaatl2q"
  name           = "Flip_Network_Comp"
  description    = "Compartment for Flip Network Resources"
  
  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
    }
  }

resource "oci_identity_compartment" "Flip_computeandstorage_Compartment" {
  compartment_id = "ocid1.compartment.oc1..aaaaaaaagsgye2ft6ssyas7uvsq7ohgehqbo7lstsgvy27chjqpbkuaatl2q"
  name           = "Flip_computeandstorage_Comp"
  description    = "Compartment for Flip Compute and Storage Resources"
  
  defined_tags = {
    "FLIPKART-TAGS.Environment" = "Prod"
    }
  }