from celery import shared_task


@shared_task
def debug_task_not_regular():
    print("debug_task_not_regular is running")
    return {"not regular task finished": True}
