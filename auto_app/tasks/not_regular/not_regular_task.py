from celery import shared_task


@shared_task
def debug_task_not_regular():
    print(888888888888888888888888888888)