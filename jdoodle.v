module set2 (a, b, c, rst);
reg [15:0] x, y;
reg [19:0] z;
output reg rst; 
output reg [7:0] a, b;
reg [15:0] p1, q1, p2, q2;
integer t, t1, t2, t3, t4, m1, m2, m3, m4, m5, m6;
integer z1, z2, z3, z4;
output reg [15:0]c;
initial 
begin
rst=1'b1;
a=8'b10000101; //input a in binary coded decimal and in reverse order
b=8'b01100111; //input b in binary coded decimal and in reverse order
end
always #10 rst=~rst; 
always @(rst)
begin 
if (rst) c= 16'b0;
else
begin
x={a,8'b0}; //Appending 0’s to get n=2k
y={b,8'b0};
p1={x[15:12]+x[7:4],x[15:12]-x[7:4]}; //divide and conquer approach
q1={x[11:8]+x[3:0],x[11:8]-x[3:0]};
p2={y[15:12]+y[7:4],y[15:12]-y[7:4]};
q2={y[11:8]+y[3:0],y[11:8]-y[3:0]};
m1=(p1[7:4]+q1[7:4])*(p2[7:4]+q2[7:4]); //Bit-wise multiplication
m2=(p1[3:0]*p2[3:0])-(q1[3:0]*q2[3:0]);
m3=(p1[7:4]-q1[7:4])*(p2[7:4]-q2[7:4]);
m4=m2;
m5=(p1[3:0] * q2[3:0])+(p2[3:0] * q1[3:0]);
m6=$signed(-m5);
t1=(m1+m3); //Interpolation
t2=(m1-m3);
t3=(m2+m4);
t4=m5-$signed(m6);
z1=(t1+t3); 
z2=(t2+t4);
z3=(t1-t3);
z4=(t2-t4);
t=(z4*1000) + (z3*100) + (z2*10) + (z1*1); //Value representation in time domain
c=t/4;
$display ("a= [%d %d], b= [%d %d], c= %d ", a [3:0], a [7:4], b [3:0], b [7:4], c);
#100 $stop;
end
end
endmodule
