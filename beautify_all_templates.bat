@echo off
cd templates

REM Overwrite add_user.html
echo {% extends "layout.html" %} > add_user.html
echo {% block content %} >> add_user.html
echo ^<form method="post" class="p-4 border rounded bg-white shadow-sm"^> >> add_user.html
echo   ^<h4>Add New User^</h4^> >> add_user.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Username^</label^>^<input type="text" class="form-control" name="username"^>^</div^> >> add_user.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Password^</label^>^<input type="password" class="form-control" name="password"^>^</div^> >> add_user.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Confirm Password^</label^>^<input type="password" class="form-control" name="confirm"^>^</div^> >> add_user.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Age^</label^>^<input type="number" class="form-control" name="age"^>^</div^> >> add_user.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Gender^</label^>^<select class="form-select" name="gender"^>^<option value="M"^>Male^</option^>^<option value="F"^>Female^</option^>^</select^>^</div^> >> add_user.html
echo   ^<button type="submit" class="btn btn-primary"^>Add User^</button^> >> add_user.html
echo ^</form^> >> add_user.html
echo {% endblock %} >> add_user.html

REM Repeat for add_course.html
echo {% extends "layout.html" %} > add_course.html
echo {% block content %} >> add_course.html
echo ^<form method="post" class="p-4 border rounded bg-white shadow-sm"^> >> add_course.html
echo   ^<h4>Add New Course^</h4^> >> add_course.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Course Name^</label^>^<input type="text" class="form-control" name="name"^>^</div^> >> add_course.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Instructor ID^</label^>^<input type="number" class="form-control" name="instructor_id"^>^</div^> >> add_course.html
echo   ^<button type="submit" class="btn btn-primary"^>Add Course^</button^> >> add_course.html
echo ^</form^> >> add_course.html
echo {% endblock %} >> add_course.html

REM Repeat for add_assignment.html
echo {% extends "layout.html" %} > add_assignment.html
echo {% block content %} >> add_assignment.html
echo ^<form method="post" class="p-4 border rounded bg-white shadow-sm"^> >> add_assignment.html
echo   ^<h4>Add Assignment^</h4^> >> add_assignment.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Course ID^</label^>^<input type="number" class="form-control" name="course_id"^>^</div^> >> add_assignment.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Title^</label^>^<input type="text" class="form-control" name="title"^>^</div^> >> add_assignment.html
echo   ^<div class="mb-3"^>^<label class="form-label"^>Due Date^</label^>^<input type="date" class="form-control" name="due_date"^>^</div^> >> add_assignment.html
echo   ^<button type="submit" class="btn btn-primary"^>Add Assignment^</button^> >> add_assignment.html
echo ^</form^> >> add_assignment.html
echo {% endblock %} >> add_assignment.html

REM Repeat for view_users.html
echo {% extends "layout.html" %} > view_users.html
echo {% block content %} >> view_users.html
echo ^<h4 class="mb-3"^>All Users^</h4^> >> view_users.html
echo ^<table class="table table-striped table-bordered"^> >> view_users.html
echo ^<thead class="table-light"^>^<tr^>^<th>ID^</th^>^<th>Username^</th^>^<th>Age^</th^>^<th>Gender^</th^>^</tr^>^</thead^> >> view_users.html
echo ^<tbody^>{% for user in users %}^<tr^>^<td^>{{ user[0] }}^</td^>^<td^>{{ user[1] }}^</td^>^<td^>{{ user[4] }}^</td^>^<td^>{{ user[5] }}^</td^>^</tr^>{% endfor %}^</tbody^> >> view_users.html
echo ^</table^> >> view_users.html
echo {% endblock %} >> view_users.html

REM Done
echo All template files have been beautified with Bootstrap.
pause
