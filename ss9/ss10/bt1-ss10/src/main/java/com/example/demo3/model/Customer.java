package com.example.demo3.model;




    public class Customer {
        private String name;
        private String dob;
        private String address;
        private String urlImage;

        public Customer(String name, String dob, String address, String urlImage) {
            this.name = name;
            this.dob = dob;
            this.address = address;
            this.urlImage = urlImage;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getDob() {
            return dob;
        }

        public void setDob(String dob) {
            this.dob = dob;
        }

        public String getAddress() {
            return address;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public String getUrlImage() {
            return urlImage;
        }

        public void setUrlImage(String urlImage) {
            this.urlImage = urlImage;
        }
    }

