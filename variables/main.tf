#  simple variables
variable "fruit_name"{
    default = "Apple"
}

output "fruit_name1"{
    value = var.fruit_name
}

# list variable example

variable "list_fruits" {
    default = ["apple","banana","pine-apple"]
}

output "first_fruit"{
    value=var.list_fruits[0]
}

output "second_fruit"{
    value=var.list_fruits[1]
}

# Map variable example

variable "cars"{
    default = {"first":"i20","second":"inova","third":"nano"}
}

output "first_car"{
    value=var.cars["first"]
}
output "second_car"{
    value=var.cars["second"]
}

# using lookup function

variable "villages"{
default ={ 
    "atp" = {
        "village_name" : "Tekulodu"
    }
    "kdp" ={
        "village_name" : "kamalapuram"
    }   
}   
}

output "groom_village_name"{
    value = try(var.villages["atp"].village_name,"TeK")
}
output "bride_village_name"{
    value = lookup(var.villages["kdp"],"village_name","Kam")
}

