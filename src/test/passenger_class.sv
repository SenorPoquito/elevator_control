package passenger;
   typedef enum {GOING_UP,GOING_DOWN,INTER} request_type;
   typedef enum {MORNING, LUNCH, NORMAL} traffic_type;
   
class request;
   
   //Properties of the Passenger Class
   rand request_type req_kind;
   rand traffic_type traffic_kind;
   rand int start_floor;
   rand int request_floor;
   rand bit request_direction;

   // Constraints on the Properties

   constraint starting_floor_constraint {
      (req_kind == GOING_UP) -> start_floor inside {0};
      (req_kind == GOING_DOWN) -> start_floor inside {1,2,3,4,5,6};
      (req_kind == INTER) -> start_floor inside {1,2,3,4,5,6};
   }
   constraint request_floor_constraint {
      (req_kind == GOING_UP) -> request_floor inside {1,2,3,4,5,6};
      (req_kind == GOING_DOWN) -> request_floor inside {0};
      (req_kind == INTER) -> start_floor inside {1,2,3,4,5,6};
   }
   constraint request_floor_not_start_constraint{
      request_floor!=start_floor;
   }
   constraint request_dist {
      (traffic_kind == MORNING) -> request_kind dist {GOING_UP :=9, GOING_DOWN:=0, INTER:=1};
      (traffic_kind == LUNCH) -> request_kind dist {GOING_UP :=9, GOING_DOWN:=7, INTER:=1};
   }
   constraint request_direction_constraint{
      
   }
   
endclass; // request


endpackage // passenger
   
