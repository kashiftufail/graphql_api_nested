This API is build using graphql and bcrypt for authentication.
If you like it give me star.

Fetch all users       


                            query{
                              users{
                                id
                                name
                                books{
                                  title
                                  description
                                  essays{
                                    heading
                                    detail
                                  }
                                }
                              }
                            }
                            


                            ########################
Fetch user with ID


                            query{
                              user(id: 1){
                                id
                                email
                                books{
                                  title
                                  description
                                  essays{
                                    heading
                                    detail
                                  }
                                }
                                
                                
                              }

                            }
                            
                            

                            ######################################
Create user 


                            mutation {
                              createUser(input: {
                                name: "a"    
                                authProvider: {
                                  credentials: {
                                    email: "email@example.com",
                                    password: "123456"
                                  }
                                }
                              }
                              )
                              {
                                id
                                name
                                email
                              }
                            }

            
                            #######################################
                            
Sign in user                            
                            

                            mutation {
                              signinUser(input: {    
                                
                                  credentials: {
                                    email: "e@example.com",
                                    password: "123456"
                                  }
                                }
                              
                                  
                              ) {
                                message,
                                token
                                user {
                                  id
                                  name
                                  email
                                }
                                
                              }  
                              
                            }



                          ###################################
Create book


                            mutation {
                              createBook(input: {                                
                                  
                                    title: " gfhs dsfdsmple.com",
                                    description: "1234 sfg khdf56"
                                  }     
                              )
                              
                              {
                                title
                                description
                                userId {
                                  id
                                  name
                                  email
                                }
                                
                                  
                                }
                            }
                              
                              
                              
                            #########################################

Fetch book with ID

                            query{
                              book(id: 9){
                                id
                                title
                                description
                                userId {
                                  id
                                  name
                                  email
                                }
                              }

                            }  
                              
      
                           #############################################

Update book with ID
                              
                            mutation {
                              updateBook(input: {    
                                
                                    id: 8,
                                    title: "ghro jjhhhh jhjfdjh",
                                    description: "hhh hjhfdshfkj"
                                  }     
                              ) 
                              {
                                book {
                                  id
                                  title
                                  description
                                }
                              }
                              
                              
                              
                              
                            }
                              

                            ###############################################

Update essay with ID

                            mutation {
                              updateEssay(input: {        
                                    id: 1,
                                    heading: "ghro jjhhhh jhjfdjh",
                                    detail: "hhh hjhfdshfkj"
                                  }     
                              ) 
                              
                              {
                                essay
                                {
                                  id
                                  bookId
                                  heading
                                  detail
                                }
                              }  
                            }
                                
            
                     #################################################

Destroy user with ID


                            mutation{
                              destroyUser(input: {
                                id: 7
                              }) {
                                id
                              }   
                            }
                              







