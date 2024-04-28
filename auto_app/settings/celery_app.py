import os

from celery import Celery, shared_task
from celery.schedules import crontab


os.environ.setdefault("DJANGO_SETTINGS_MODULE", "settings.settings")

app = Celery("celery")
app.config_from_object("django.conf:settings", namespace="CELERY")
app.autodiscover_tasks()

# SecurityWarning: You're running the worker with superuser privileges: this is
# worker_a            | absolutely not recommended!
# worker_a            |
# worker_a            | Please specify a different user using the --uid option.


# app.conf.beat_scheduler = {
#     'log_test_data_testing': {
#         'task': 'tasks.regular.testing_task.log_test_data',
#         'schedule': crontab(),
#         # 'schedule': timedelta(seconds=60),
#         'args': [],
#     },
# }

@app.task(bind=True, ignore_result=True)
def debug_task(self):
    print(f"Request: {self.request!r}")
