Rails.application.routes.draw do
  get '/' => 'prices#root', as: 'root'
  post 'best_price' => 'prices#best_price'
  get 'result' => 'prices#result'
end
