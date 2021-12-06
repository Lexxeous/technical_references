*** Settings ***
Resource  ./po/landing-page.robot
Resource  ./po/top-nav.robot
Resource  ./po/search-results.robot
Resource  ./po/product.robot
Resource  ./po/cart.robot
Resource  ./po/sign-in.robot

*** Keywords ***
Search for Products
    landing-page.Load
    landing-page.Verify Page Loaded
    top-nav.Search for Products
    search-results.Verify Search Completed

Select Product from Search Results
    search-results.Click Product link
    product.Verify Page Loaded

Add Product to Cart
    product.Add to Cart
    cart.Verify Product Added

Begin Checkout
    cart.Proceed to Checkout
    sign-in.Verify Page Loaded