class DatabaseConnection:
    _instance = None
    def __new__(cls):
        if cls._instance is None:
            print("Creating database connection...")
            cls._instance = super().__new__(cls)
        return cls._instance
    def connect(self):
        print("Connected to the database")


db1 = DatabaseConnection()
db1.connect()
db2 = DatabaseConnection()
db2.connect()
print(db1 is db2)
