import datetime
import random


def generate_random_name():
    with open('names.txt') as f:
        lines = [line.rstrip() for line in f]
    return random.choice(lines)


def generate_random_currency_list():
    currency_list = list(read_currency_file())
    random.shuffle(currency_list)
    return tuple(currency_list)


def generate_random_quantity():
    return random.randrange(50, 550, 50)


def read_currency_file():
    with open('currencies.txt') as f:
        currencies = [tuple(line.rstrip().split(",")) for line in f]
    return currencies


def generate_random_birth_date():
    start_date = datetime.date(1990, 1, 1)
    end_date = datetime.date(2005, 12, 31)

    time_between_dates = end_date - start_date
    days_between_dates = time_between_dates.days
    random_number_of_days = random.randrange(days_between_dates)
    random_date = start_date + datetime.timedelta(days=random_number_of_days)
    return random_date.isoformat()


def generate_random_sentence():
    nouns = ["puppy", "car", "rabbit", "girl", "monkey"]
    verbs = ["runs", "hits", "jumps", "drives", "barfs"]
    adj = ["adorable", "clueless", "dirty", "odd", "stupid"]
    adv = ["crazily.", "dutifully.", "foolishly.", "merrily.", "occasionally."]

    random_entry = lambda x: x[random.randrange(len(x))]
    return " ".join([random_entry(nouns), random_entry(verbs), random_entry(adj), random_entry(adv)])


def generate_post():
    return dict(id="", description=generate_random_sentence())


def generate_new_user():
    return dict(id="", name=generate_random_name(), birthDate=generate_random_birth_date())
