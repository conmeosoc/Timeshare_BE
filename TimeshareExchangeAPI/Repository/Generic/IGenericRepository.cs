using NuGet.Common;
using System.Linq.Expressions;

namespace TimeshareExchangeAPI.Repository.Generic
{
    public interface IGenericRepository<TEntity> where TEntity : class
    {
        public List<TEntity> GetAll();
        public TEntity GetById(string id);
        public void Create(TEntity entity);
        public void Update(TEntity entity);
        public void UpdatePatch(TEntity entity);
        public void Delete(TEntity entity);
        public TEntity GetSingle(Expression<Func<TEntity, bool>> predicate, params Expression<Func<TEntity, object>>[] includeProperties);
        public IQueryable<TEntity> Get(Expression<Func<TEntity, bool>> predicate = null, params Expression<Func<TEntity, object>>[] includeProperties);
    }
}
