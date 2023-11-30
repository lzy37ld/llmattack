from multiprocessing import Process, JoinableQueue
import time

def consumer(q):
    while True:
        item = q.get()
        if item is None:  # 接收到 None 时，代表所有任务已完成
            q.task_done()
            break
        print(f"处理 {item}")
        time.sleep(1)  # 模拟处理时间
        q.task_done()  # 指示任务已完成

def producer(q, items):
    for item in items:
        print(f"添加 {item}")
        q.put(item)  # 向队列添加任务
    q.put(None)  # 添加 None 来指示所有任务已添加

if __name__ == '__main__':
    q = JoinableQueue()

    # 创建并启动消费者进程
    cons_p = Process(target=consumer, args=(q,))
    cons_p.start()

    # 生产者添加任务
    producer(q, range(5))

    # 等待所有任务完成
    q.join()
    print("所有任务已处理完成。")

    # 等待消费者进程结束
    cons_p.join()
