from settings.celery_app import app as celery_app



@celery_app.task
def log_test_data():
    with open('logging.txt', 'a') as file:
        file.write('5555\n')
