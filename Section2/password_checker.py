password = input("Enter password: ")
score = 0

# Checks
if len(password) >= 8:
    score += 1
else:
    print("• Password should be at least 8 characters")
if any(c.isupper() for c in password):
    score += 1
else:
    print("• Add uppercase letter")
if any(c.islower() for c in password):
    score += 1
else:
    print("• Add lowercase letter")
if any(c.isdigit() for c in password):
    score += 1
else:
    print("• Add number")
if any(not c.isalnum() for c in password):
    score += 1
else:
    print("• Add special character")

# Strength
if score <= 2:
    strength = "Weak"
elif score <= 4:
    strength = "Medium"
else:
    strength = "Strong"
print("\nScore:", score, "/5")
print("Strength:", strength)
