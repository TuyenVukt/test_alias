function viewMoney(price){
    if(price!=null){
        return price.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");
    } else return "";
}