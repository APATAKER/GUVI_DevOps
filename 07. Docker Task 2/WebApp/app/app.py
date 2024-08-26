from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <h1>Hello and Welcome to DevOps</h1>
    <p>Name: Raja</p>
    <p>Version: M</p>
    <p>Specialty: new learner</p>
    '''

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
