class TasksController < ApplicationController
  def index
     #put all functionality into the controller
     #@task=['make dinner','go to bed']
     
     #we could use the manual list above, but the model gives us 
     #functionality where we can use this
     #which grabs all the tasks in the database
     
     @task= Task.all
  end

  def new
    #Task is the class name
    #.new means you are intitiating the task
    @task = Task.new
  end
  
  
  def create
    @task = Task.new(task_params)
    if @task.save
    #once the task is created, redirect it to the first page
      redirect_to tasks_path
    else
      render 'new'
      
      #this shows any errors in the console: it is commented out for now
      #as we will store errors on new task page
      #p @task.errors.full_messages
    end
  end
  
  
  def edit
    @task = Task.find(params[:id])
  end
  
  
  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end
  
  def show
    @task = Task.find(params[:id])
  end
  
  def complete
    
    @task=Task.find(params[:id])
    @task.update_attribute(:Completed,params[:Completed])
    redirect_to tasks_path
    
  end
  
  
  #this function allows you to pass params from new task
  #to the create task
  private 
  def task_params
    params.require(:task).permit(:title, :details, :Completed)
  end
  
end
