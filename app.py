from flask import Flask, request, jsonify, render_template

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("login.html")

@app.route("/login", methods=["POST"])
def login():
    username = request.form.get("username")
    password = request.form.get("password")

    if username == "admin" and password == "admin123":
        return f"<h2>Welcome {username}!</h2>"

    return "<h2>Invalid credentials, try again.</h2>"
    
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

