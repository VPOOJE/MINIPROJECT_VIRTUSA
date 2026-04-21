rates = {
    "economy": 10,
    "premium": 18,
    "suv": 25
}

def calculate_fare(distance, vehicle_type, hour):
    if vehicle_type not in rates:
        return None

    rate_per_km = rates[vehicle_type]
    base_fare = distance * rate_per_km

    if 17 <= hour <= 20:
        surge_multiplier = 1.5
    else:
        surge_multiplier = 1

    return base_fare * surge_multiplier


print("Welcome to CityCab Fare Calculator")
print("-------------------------------------")

try:
    distance = float(input("Enter distance (in km): "))
    vehicle_type = input("Enter vehicle type (Economy / Premium / SUV): ").strip().lower()
    while True:
        hour = int(input("Enter hour of travel (0-23): "))
        if 0 <= hour <= 23:
            break
        else:
            print("Invalid hour! Please enter a value between 0 and 23.")

    fare = calculate_fare(distance, vehicle_type, hour)

    if fare is None:
        print("Service Not Available for this vehicle type")
    else:
        print("\n========= PRICE RECEIPT =========")
        print(f"Distance        : {distance} km")
        print(f"Vehicle Type    : {vehicle_type.capitalize()}")
        print(f"Travel Hour     : {hour}")

        if 17 <= hour <= 20:
            print("Surge Pricing   : Applied (1.5x)")
        else:
            print("Surge Pricing   : Not Applied")

        print(f"Total Fare      : ₹{fare:.2f}")
        print("=================================")

except ValueError:
    print("Invalid input! Please enter correct values.")
