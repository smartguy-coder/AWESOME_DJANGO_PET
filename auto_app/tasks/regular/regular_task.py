from settings.celery_app import app as celery_app


@celery_app.task
def some_regular_test_task():
    print("some_regular_test_task is running")
    return {"some_regular_test_task": "finished"}
