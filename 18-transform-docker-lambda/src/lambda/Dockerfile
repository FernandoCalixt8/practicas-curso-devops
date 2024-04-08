FROM public.ecr.aws/lambda/python:3.12

# install packages
COPY requirements.txt ${LAMBDA_TASK_ROOT}
RUN pip install -r requirements.txt

# copy function code
COPY main.py ${LAMBDA_TASK_ROOT}

CMD [ "main.lambda_handler" ]