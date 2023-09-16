/******************************************************************************
Draw your initials below in perspective.
******************************************************************************/

void persp_initials()
{
  Perspective(60,1,100);
  
  Begin_Shape();
  
  // Draw A
  Vertex(0.50,0.70,5);
  Vertex(1,0.05,5);
  
  Vertex(1,0.05,5);
  Vertex(1.5,0.70,5);
  
  Vertex(0.666,0.33,5);
  Vertex(1.33,0.33,5);
  
  //Draw P
  Vertex(0,.05,8);
  Vertex(-0.5,.05,8);
  
  Vertex(0,.2,5);
  Vertex(-0.5,.2,5);
  
  Vertex(-0.5,.05,8);
  Vertex(-0.5,.2,5);
  
  Vertex(0,.05,8);
  Vertex(0,.2,5);
  
  Vertex(0,.2,5);
  Vertex(0,.5,3);
  
  
  
  
  End_Shape();
  
}
