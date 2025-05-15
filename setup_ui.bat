@echo off
REM Navigate to templates folder
cd templates

REM Create layout.html
echo ^<!DOCTYPE html^> > layout.html
echo ^<html lang="en"^> >> layout.html
echo ^<head^> >> layout.html
echo ^  ^<meta charset="UTF-8"^> >> layout.html
echo ^  ^<title^>E-Learning Platform^</title^> >> layout.html
echo ^  ^<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"^> >> layout.html
echo ^</head^> >> layout.html
echo ^<body class="bg-light text-dark"^> >> layout.html
echo. >> layout.html
echo ^  ^<div class="container my-5"^> >> layout.html
echo ^    ^<h2 class="mb-4 text-primary"^>E-Learning Platform^</h2^> >> layout.html
echo ^    ^{% block content %}{% endblock %}^ >> layout.html
echo ^    ^<a href="/" class="btn btn-secondary mt-4"^>⬅ Back to Home^</a^> >> layout.html
echo ^  ^</div^> >> layout.html
echo ^</body^> >> layout.html
echo ^</html^> >> layout.html

REM Overwrite index.html
echo {% extends "layout.html" %} > index.html
echo {% block content %} >> index.html
echo ^<div class="list-group"^> >> index.html
echo   ^<a href="/add_user" class="list-group-item list-group-item-action"^>➕ Add User^</a^> >> index.html
echo   ^<a href="/add_course" class="list-group-item list-group-item-action"^>➕ Add Course^</a^> >> index.html
echo   ^<a href="/add_assignment" class="list-group-item list-group-item-action"^>➕ Add Assignment^</a^> >> index.html
echo   ^<a href="/view_users" class="list-group-item list-group-item-action"^>📋 View Users^</a^> >> index.html
echo   ^<a href="/view_courses" class="list-group-item list-group-item-action"^>📋 View Courses^</a^> >> index.html
echo   ^<a href="/view_assignments" class="list-group-item list-group-item-action"^>📋 View Assignments^</a^> >> index.html
echo ^</div^> >> index.html
echo {% endblock %} >> index.html

REM Done
echo Bootstrap UI setup complete.
pause
