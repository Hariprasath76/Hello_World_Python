Project Structure

onedata_project/
│
├── manage.py
│
├── Task/                # Django project folder
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
│
└── greet/               # App folder
    ├── __init__.py
    ├── views.py
    ├── urls.py
    ├── forms.py
    └── templates/
        └── greet.html

# Hello_World_Python
"Hello &lt;Name>! Welcome to the One Data Solution."

How to Run Locally
Clone the repository:
git clone https://github.com/Hariprasath76/Hello_World_Python.git
cd onedata project/
python -m venv venv
venv\Scripts\activate 
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver

Check the output of the Applications:
http://127.0.0.1:8000/



**Example Output**

Enter your name → HARIPRASATH
Output:
Hello HARIPRASATH! Welcome to the One Data Solution.

