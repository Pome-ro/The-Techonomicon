function Get-ModelBreakdown {
    [CmdletBinding()]
    param (
        # Model STRING
        [Parameter(Mandatory = $true)]
        [string]
        $ModelSTRING
    )

    begin {

    }

    process {

        switch ($ModelSTRING) {
            "iPad 10th Generation (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(10)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output

            }
            "iPad 10th Generation (Wi-Fi/Cellular)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(10)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi/Cellular")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 5th Generation (Cellular)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(5)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Cellular")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 5th Generation (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(5)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 6th Generation (Cellular)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(6)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Cellular")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 6th Generation (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(6)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 7th Generation (Cellular)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(7)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Cellular")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 7th Generation (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(7)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 8th generation (Cellular)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(8)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Cellular")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 8th generation (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(8)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 9th generation (Cellular)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(9)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Cellular")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad 9th generation (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(9)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad Air (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Air")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(1)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad Air 2 (CDMA)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Air")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(2)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("CDMA")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad Air 2 (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Air")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(2)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad Air 3rd generation (Cellular)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Air")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(3)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Cellular")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad Air 5th generation (Cellular)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Air")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(5)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Cellular")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad Air 5th generation (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Air")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(5)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad Pro (11-inch) (3rd generation)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Pro")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(3)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @(11)
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad mini 4 (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Mini")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(4)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPad mini 5th generation (Wi-Fi)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPad")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Mini")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(5)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("Wi-Fi")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPhone 11" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPhone")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(11)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPhone 12" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPhone")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(12)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPhone 13" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPhone")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(13)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPhone 7" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPhone")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(7)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPhone SE (2nd Generation)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPhone")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("SE")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(2)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPhone SE (3rd Generation)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPhone")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("SE")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(3)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPhone XR" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPhone")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("XR")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(1)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            "iPod touch (7th generation)" {
                $output = @(
                    @{
                        name                                = "Product Type"
                        type                                = "STRING"
                        value                               = @("iPod")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Subtype"
                        type                                = "STRING"
                        value                               = @("Touch")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Generation"
                        type                                = "INTEGER"
                        value                               = @(7)
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Connectivity Type"
                        type                                = "STRING"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }, @{
                        name                                = "Product Screen Size (inch)"
                        type                                = "INTEGER"
                        value                               = @("")
                        extensionAttributeCollectionAllowed = $false
                    }
                )
                Write-Output $output
            }
            Default {}
        }
    }

    end {

    }
}

# $creds = Get-Credential
# $NewDeviceData = Import-CSV -Path "~\desktop\update-buildings.csv"
# $NewDeviceData = Import-CSV ~\downloads\devices_1698072233610.csv | select SERIAL_NO, DEVICE_ID, PRODUCT_FAMILY, MODEL_NAME, PART_NUMBER, DEVICE_CAPACITY, COLOR, PURCHASE_SOURCE, ORDER_NUMBER, @{Name = "DATE_ADDED_TO_ORGANIZATION"; Expression = { [datetime]$_.DATE_ADDED_TO_ORGANIZATION } }, @{Name = "DATE_REMOVED_FROM_ORGANIZATION"; Expression = { [datetime]$_.DATE_REMOVED_FROM_ORGANIZATION } }, MDM_SERVER, @{Name = "DATE_ASSIGNED_TO_MDM_SERVER"; Expression = { [datetime]$_.DATE_ASSIGNED_TO_MDM_SERVER } }

$AuthURI = "https://mdm.mansfieldct.org:8443/api/v1/auth/token"
# $Token = Invoke-RestMethod -Method Post -Credential $creds -Authentication Basic -Uri $AuthURI -ContentType $Content
# $Token = $Token.token
$Token = "eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhdGVkLWFwcCI6IkdFTkVSSUMiLCJhdXRoZW50aWNhdGlvbi10eXBlIjoiSlNTIiwiZ3JvdXBzIjpbXSwic3ViamVjdC10eXBlIjoiSlNTX1VTRVJfSUQiLCJ0b2tlbi11dWlkIjoiNjI0YTlhMjUtZmJmNy00ZTYyLTk4ZDAtNGM5ODBiYTdlMjk5IiwibGRhcC1zZXJ2ZXItaWQiOi0xLCJzdWIiOiIxIiwiZXhwIjoxNjk4MjQ4OTE5fQ.iJJh6Q_lBY4lXx15RbFab7mCWmbr1UUQcOvpseBHAc0"
$Headers = @{
    Authorization = "Bearer $Token"
}
$Content = "application/json;charset=UTF-8"
$URI = "https://mdm.mansfieldct.org:8443/api/v2/mobile-devices?page=0&page-size=631&sort=id%3Aasc"

$Devices = Invoke-RestMethod -Method GET -Headers $Headers -URI $URI -ContentType $Content
$DEVICES.totalCount

foreach ($Device in $Devices.Results) {
    $DeviceID = $Device.ID
    $Body = @{updatedExtensionAttributes = Get-ModelBreakdown $device.model }
    $Body = ConvertTo-Json $Body -Depth 4
    $URI = "https://mdm.mansfieldct.org:8443/api/v2/mobile-devices/$DeviceID"
    $SetData = Invoke-RestMethod -Method Patch -headers $Headers -URI $URI -ContentType $Content -Body $Body
}

<#-------------------------------------------------------------------------#>
# foreach ($newdata in $NewDeviceData) {


#     $Device = $Devices.Results | Where-object { $_.SerialNumber -eq $newdata.SERIAL_NO }
#     $DeviceID = $Device.ID
#     if ($null -ne $Device) {
#         Write-Host "Found Entry: $($Device.serialNumber)"
#         Write-Host "Device ID: $($DeviceID)"
#         $DateAssignedToMDMServer = if ($newdata.DATE_ASSIGNED_TO_MDM_SERVER -ne $NULL) {
#             Write-Output (GET-DATE $newdata.DATE_ASSIGNED_TO_MDM_SERVER -format "yyyy-MM-dd hh:mm:ss")
#         }
#         else {
#             Write-Output ""
#             Write-Host "Setting MDM Date to blank string." -ForegroundColor Green
#         }
#         $DateAddedToOrganization = if ( $newdata.DATE_ADDED_TO_ORGANIZATION -ne $NULL) {
#             Write-Output (GET-DATE $newdata.DATE_ADDED_TO_ORGANIZATION -format "yyyy-MM-dd hh:mm:ss")
#         }
#         else {
#             Write-Output ""
#             Write-Host "Setting Organization Date to blank string." -ForegroundColor Green
#         }

#         $Body = @{
#             ios                        = @{
#                 purchasing = @{
#                     vendor = $newdata.PURCHASE_SOURCE
#                 }
#             }
#             updatedExtensionAttributes = @(
#                 @{
#                     name                                = "Date Assigned to MDM Server"
#                     type                                = "DATE"
#                     value                               = @(
#                         $DateAssignedToMDMServer
#                     )
#                     extensionAttributeCollectionAllowed = $false
#                 },
#                 @{
#                     name                                = "Date Added To ASM"
#                     type                                = "DATE"
#                     value                               = @(
#                         $DateAddedToOrganization
#                     )
#                     extensionAttributeCollectionAllowed = $false
#                 },
#                 @{
#                     name                                = "Apple Order Number"
#                     type                                = "STRING"
#                     value                               = @($newdata.ORDER_NUMBER)
#                     extensionAttributeCollectionAllowed = $False
#                 }
#             )
#         }
#         $Body = ConvertTo-Json $Body -Depth 4
#         $URI = "https://mdm.mansfieldct.org:8443/api/v2/mobile-devices/$DeviceID"
#         $SetData = Invoke-RestMethod -Method Patch -headers $Headers -URI $URI -ContentType $Content -Body $Body
#         # Write-Host "$($Device.name) now named: $($SetName.name)"
#     }
#     else {
#         Write-Host "Device Not Found: $($newdata.SERIAL_NO)"
#     }
# }


# $BuildingID = switch ($newdata.schoolid) {
#     "GN" { 1 }
#     "VN" { 2 }
#     "SE" { 3 }
#     "MES" { 7 }
#     Default {}
# }

# $Body = @{
#     name     = $newdata.device_tag
#     location = @{
#         buildingId = $BuildingID
#         room       = $newdata.home_room
#     }
# }
#}