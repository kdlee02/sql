//1. 환경 설정 및 컬렉션 생성
// users, categories, posts
use blog

db.posts.drop()
db.categories.drop()
db.users.drop()



db.createCollection("users")
db.createCollection("categories")
db.createCollection("posts")


show collections

//2. 데이터 삽입

db.users.insertMany( [
 {name: "John Doe", email: "john@example.com"},
{name: "Jane Smith", email: "jane@example.com"},
{name: "Alice Johnson", email: "alice@example.com"}
 ] ); 
 
 
db.categories.insertMany( [
{name: "Technology"},
{name: "Health"},
{name: "Lifestyle"}
 ] );
 
 db.posts.insertMany( [
{title: "MongoDB Basics", body: "Learning MongoDB is fun!", author: "John Doe", category:
"Technology", comments: [], date: new Date("2023-01-10") },
{title: "Understanding Indexes in MongoDB", body: "Indexes enhance your database's performance.", author: "John Doe", category: "Technology", comments: [], date: new
Date("2023-01-15") },
{title: "NoSQL vs SQL: Choosing the Right Database", body: "Learn the key differences and choose the right database for your needs.", author: "Alice Johnson", category:
"Technology", comments: [], date: new Date("2023-01-20") },
{title: "Healthy Living", body: "Tips to a healthier lifestyle...", author: "Jane Smith", category:
"Health", comments: [], date: new Date("2023-01-05") },
{ title: "Meditation and Mindfulness", body: "Discover the benefits of meditation...", author:
"Alice Johnson", category: "Lifestyle", comments: [], date: new Date("2023-01-18") }
 ] );
 
 db.posts.find()
 
 
//3. 데이터 검색
//① 포스트 제목으로 MongoDB에 관련된 문서 검색,
db.posts.find({title: {$regex : 'MongoDB'}})

//② 포스트 카테고리 Technology로 필터링 후 최신 포스트 순으로 정렬
db.posts.find({category: "Technology"}).sort({ date: -1 });

//4. 데이터 수정
//① MongoDB Basics 포스트에 댓글 추가 (comment 필드에 {author: "Jane Smith", text: "Great post!"} 추가)
db.posts.updateOne(
{ title: "MongoDB Basics" },
{ $push: { comment: {author: "Jane Smith", text: "Great post!"} } }
);

db.posts.find({title: 'MongoDB Basics'})

//② Healthy Living 포스트의 lifestyle 단어를 tips로 수정
db.posts.updateOne(
   { title: "Healthy Living", body: "Tips to a healthier lifestyle..." },
   { $set: { body : "Healthy living guide" } })


db.posts.find()


//5. 데이터 삭제
//① 4-①의 댓글 삭제
db.posts.updateOne(
{ title: "MongoDB Basics" },
{ $pop: { comment: -1 } }
);

db.posts.find()
 
 

