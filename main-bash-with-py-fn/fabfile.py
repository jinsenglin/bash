def hello():
    print("hello")

def dump_yaml():
    import yaml
    f = open("main.yaml", "r")
    y = yaml.load(f)
    f.close()
    print(y)

def get_version():
    import yaml
    f = open("main.yaml", "r")
    y = yaml.load(f)
    f.close()
    print(y['version'])
