# checkout-system

Our client is an online marketplace, here is a sample of some of the products available on our site: 


Product code | Name | Price 

001 | Very Cheap Chair | £9.25

002 | Little table | £45.00

003 | Funky light | £19.95 


Our marketing team want to offer promotions as an incentive for our customers to purchase these items. 

If you spend over £60, then you get 10% off of your purchase. If you buy 2 or more very cheap chairs then the price drops to £8.50. 

Our check-out can scan items in any order, and because our promotions will change, it needs to be flexible regarding our promotional rules. 

The interface to our checkout looks like this (shown in Ruby): 
co = Checkout.new​(promotional_rules) 
co.scan​(item) 
co.scan​(item) 
price = co.total