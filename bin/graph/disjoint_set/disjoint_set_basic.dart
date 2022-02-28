class DisjointSet {

  final int _totalNodes;
  int get totalNodes => _totalNodes;

  late List<int> root = [];
  late List<int> rank = [];

  DisjointSet(this._totalNodes){

    root = List.filled(_totalNodes, 0);
    rank = List.filled(_totalNodes, 1);

    for(int i=0; i<_totalNodes; i++){
      root[i] = i;
    }
  }

  int find(int x){
    if (x == root[x]) {
      return x;
    }
    return root[x] = find(root[x]);
  }

  void union(int x, int y){
    int rootX = find(x);
    int rootY = find(y);
    if (rootX != rootY) {
      if (rank[rootX] > rank[rootY]) {
        root[rootY] = rootX;
      } else if (rank[rootX] < rank[rootY]) {
        root[rootX] = rootY;
      } else {
        root[rootY] = rootX;
        rank[rootX] += 1;
      }
    }
  }

  bool isConnected(int x, int y) {
    return find(x) == find(y);
  }

}

void main(){
  DisjointSet uf = DisjointSet(10);
  // 1-2-5-6-7 3-8-9 4
  uf.union(1, 2);
  uf.union(2, 5);
  uf.union(5, 6);
  uf.union(6, 7);
  uf.union(3, 8);
  uf.union(8, 9);
  print(uf.isConnected(1, 5)); // true
  print(uf.isConnected(5, 7)); // true
  print(uf.isConnected(4, 9)); // false
  // 1-2-5-6-7 3-8-9-4
  uf.union(9, 4);
  print(uf.isConnected(4, 9));
}