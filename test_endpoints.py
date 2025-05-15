import requests

BASE_URL = "http://127.0.0.1:5000"

# -------------------- 1. Add User --------------------
user_data = {
    "username": "Jdawg0309",
    "password": "Junaet123",
    "confirm": "Junaet123",
    "age": 23,
    "gender": "M"
}
r1 = requests.post(f"{BASE_URL}/add_user", data=user_data)
print("✅ User Created:", r1.status_code)

# -------------------- 2. Add Course --------------------
# Assuming user ID will be 1 (first in DB). You can update this if needed.
course_data = {
    "name": "CSC 33600",
    "instructor_id": None  # Junaet is a student, no instructor assigned
}
r2 = requests.post(f"{BASE_URL}/add_course", data=course_data)
print("✅ Course Created:", r2.status_code)

# -------------------- 3. Add Assignment --------------------
# Assuming course ID will be 1 (first course). Update if needed.
assignment_data = {
    "course_id": 1,
    "title": "CSC33600 final project due on May 15 2025",
    "due_date": "2025-05-15"
}
r3 = requests.post(f"{BASE_URL}/add_assignment", data=assignment_data)
print("✅ Assignment Created:", r3.status_code)
