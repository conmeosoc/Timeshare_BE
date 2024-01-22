//using Microsoft.EntityFrameworkCore;
//using System.Linq.Expressions;
//using TimeshareExchangeAPI.Entities;

//namespace TimeshareExchangeAPI.Repository.Generic
//{
//    public class GenericRepository<TEntity> : IGenericRepository<TEntity> where TEntity : class
//    {
//        protected readonly TimeshareExchangeContext _context;
//        private DbSet<TEntity> _dbSet;
//        public GenericRepository()
//        {
//            _context = new TimeshareExchangeContext();
//            _dbSet = _context.Set<TEntity>();
//        }

//        protected DbSet<TEntity> DbSet
//        {
//            get
//            {
//                if (_dbSet != null)
//                {
//                    return _dbSet;
//                }

//                _dbSet = _context.Set<TEntity>();
//                return _dbSet;
//            }
//        }

//        public void Create(TEntity entity)
//        {
//            _dbSet.Add(entity);
//            _context.SaveChanges();
//        }

//        public void Delete(TEntity entity)
//        {
//            _dbSet.Remove(entity);
//            _context.SaveChanges();
//        }

//        public IQueryable<TEntity> Get(Expression<Func<TEntity, bool>> predicate = null, params Expression<Func<TEntity, object>>[] includeProperties)
//        {
//            IQueryable<TEntity> queryable = DbSet.AsTracking();
//            includeProperties = includeProperties?.Distinct().ToArray();
//            if (includeProperties?.Any() ?? false)
//            {
//                Expression<Func<TEntity, object>>[] array = includeProperties;
//                foreach (Expression<Func<TEntity, object>> navigationPropertyPath in array)
//                {
//                    queryable = queryable.Include(navigationPropertyPath);
//                }
//            }

//            return predicate == null ? queryable : queryable.Where(predicate);
//        }

//        public virtual TEntity GetSingle(Expression<Func<TEntity, bool>> predicate, params Expression<Func<TEntity, object>>[] includeProperties)
//        {
//            return Get(predicate, includeProperties).FirstOrDefault();
//        }

//        public List<TEntity> GetAll()
//        {
//            return _dbSet.ToList();
//        }

//        public TEntity GetById(string id)
//        {
//            return _dbSet.Find(id);
//        }

//        public void Update(TEntity entity)
//        {
//            _dbSet.Update(entity);
//            _context.SaveChanges();
//        }

//        public void UpdatePatch(TEntity entity)
//        {
//            throw new NotImplementedException();
//        }
//    }
//}
