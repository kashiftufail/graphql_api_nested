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


                            mutation{
                              destroyUser(input: {
                                id: 7
                              }) {
                                id
                              }   
                            }
                              







