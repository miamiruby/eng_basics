class FibsController < ApplicationController
  expose :fibs, ->{ Fib.all }
  expose :fib

  def create
    if fib.save
      redirect_to fib, notice: 'Fib was successfully created.'
    else
      render :new
    end
  end

  def update
    if fib.update(fib_params)
      redirect_to fib, notice: 'Fib was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    fib.destroy
    redirect_to fibs_url, notice: 'Fib was successfully destroyed.'
  end

  private
  def fib_params
    params.require(:fib).permit(:iterations)
  end
end
