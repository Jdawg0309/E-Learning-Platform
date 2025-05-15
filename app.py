from flask import Flask, render_template, request, redirect
import mysql.connector
import os
from dotenv import load_dotenv

app = Flask(__name__, template_folder="../frontend/templates")

load_dotenv()


# ✅ Replace these with your actual AWS RDS MySQL credentials
db = mysql.connector.connect(
    host=os.getenv("DB_HOST"),
    port=int(os.getenv("DB_PORT")),
    user=os.getenv("DB_USER"),
    password=os.getenv("DB_PASSWORD"),
    database=os.getenv("DB_NAME")
)
cursor = db.cursor()

@app.route('/')
def index():
    return render_template('index.html')

# ------------------ USER ------------------
@app.route('/add_user', methods=['GET', 'POST'])
@app.route('/add_user', methods=['GET', 'POST'])
def add_user():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        confirm = request.form['confirm']
        age = int(request.form['age'])
        gender = request.form['gender']
        role = request.form['role']  # 👈 Add this

        try:
            cursor.execute("""
                INSERT INTO User (Username, Password, ConfirmPassword, Age, Gender, Role)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (username, password, confirm, age, gender, role))
            db.commit()
            return "✅ User added successfully!"
        except mysql.connector.Error as err:
            return f"❌ Error: {err}"
    return render_template('add_user.html')


# ------------------ COURSE ------------------
@app.route('/add_course', methods=['GET', 'POST'])
def add_course():
    if request.method == 'POST':
        name = request.form['name']
        instructor_id = request.form['instructor_id']
        try:
            cursor.execute("""
                INSERT INTO Course (CourseName, InstructorId)
                VALUES (%s, %s)
            """, (name, instructor_id if instructor_id else None))
            db.commit()
            return "✅ Course added successfully!"
        except mysql.connector.Error as err:
            return f"❌ Error: {err}"
    return render_template('add_course.html')

# ------------------ ASSIGNMENT ------------------
@app.route('/add_assignment', methods=['GET', 'POST'])
def add_assignment():
    if request.method == 'POST':
        course_id = request.form['course_id']
        title = request.form['title']
        due_date = request.form['due_date']
        try:
            cursor.execute("""
                INSERT INTO Assignment (CourseId, Title, DueDate)
                VALUES (%s, %s, %s)
            """, (course_id, title, due_date))
            db.commit()
            return "✅ Assignment added successfully!"
        except mysql.connector.Error as err:
            return f"❌ Error: {err}"
    return render_template('add_assignment.html')

# ------------------ VIEW USERS ------------------
@app.route('/view_users')
def view_users():
    cursor.execute("SELECT * FROM User")
    users = cursor.fetchall()
    return render_template('view_users.html', users=users)

# ------------------ VIEW COURSES ------------------
@app.route('/view_courses')
def view_courses():
    cursor.execute("SELECT * FROM Course")
    courses = cursor.fetchall()
    return render_template('view_courses.html', courses=courses)

# ------------------ VIEW ASSIGNMENTS ------------------
@app.route('/view_assignments')
def view_assignments():
    cursor.execute("SELECT * FROM Assignment")
    assignments = cursor.fetchall()
    return render_template('view_assignments.html', assignments=assignments)

# ------------------ NOTE GENERATOR ------------------
@app.route('/generate_notes', methods=['GET', 'POST'])
def generate_notes():
    summary = None
    if request.method == 'POST':
        content = request.form['content']
        # 📌 Placeholder: call OpenAI API here later
        summary = f"(This would be an AI-generated summary of: {content[:60]}...)"
    return render_template('note_generator.html', summary=summary)

# ------------------ ASK AI ------------------
@app.route('/ask_ai', methods=['GET', 'POST'])
def ask_ai():
    answer = None
    if request.method == 'POST':
        question = request.form['question']
        # 📌 Placeholder: AI response logic here
        answer = f"(This would be an AI answer to: {question})"
    return render_template('ask_ai.html', answer=answer)

# ------------------ QUIZ GENERATOR ------------------
@app.route('/generate_quiz', methods=['GET', 'POST'])
def generate_quiz():
    quiz = None
    if request.method == 'POST':
        topic = request.form['topic']
        # 📌 Placeholder: Generate questions from OpenAI
        quiz = [f"Sample MCQ 1 for {topic}", "Sample MCQ 2", "Sample MCQ 3"]
    return render_template('generate_quiz.html', quiz=quiz)


if __name__ == '__main__':
    app.run(debug=True)
