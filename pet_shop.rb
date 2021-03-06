def pet_shop_name(shop)
  return shop[:name]
end

def total_cash(shop)
  return shop[:admin][:total_cash]
end

def add_or_remove_cash(shop, cash)
  shop[:admin][:total_cash] += cash
end

def pets_sold(shop)
  return shop[:admin][:pets_sold]
end

def increase_pets_sold(shop, pets_sold_number)
  shop[:admin][:pets_sold] += pets_sold_number
end

def stock_count(shop)
  return shop[:pets].length()
end

def pets_by_breed(shop, breed)
  specific_breed = []
  for pet in shop[:pets]
    if pet[:breed] == breed
      specific_breed.push(pet)
    end
  end
  return specific_breed
end

def find_pet_by_name(shop, pet_name)
  for pet in shop[:pets]
    return pet if pet[:name] == pet_name
  end
  return nil
end

def remove_pet_by_name(shop, pet_name)
  pet = find_pet_by_name(shop, pet_name)
  shop[:pets].delete(pet)
end

def add_pet_to_stock(shop, new_pet)
  shop[:pets].push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
    customer[:cash] -= cash
end

def customer_pet_count(customer)
  customer[:pets].count()
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  return if new_pet == nil
  return true if customer[:cash] >= new_pet[:price]
  return false
end

def sell_pet_to_customer(shop, pet, customer)
  if customer_can_afford_pet(customer, pet) == true
    customer[:pets].push(pet)

    increase_pets_sold(shop, 1)

    remove_customer_cash(customer, pet[:price])

    add_or_remove_cash(shop, pet[:price])

    remove_pet_by_name(shop, pet[:name])
  end
end
