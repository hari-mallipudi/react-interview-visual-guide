/**
 * useState Counter Example
 * 
 * What it demonstrates:
 * - Basic useState syntax
 * - State updates trigger re-renders
 * - Functional update form (prev => prev + 1)
 * 
 * Interview tips:
 * - Explain that setState is asynchronous
 * - Show you know functional update form for state based on previous value
 * - Mention that component re-renders when state changes
 */

import { useState } from 'react';

function CounterExample() {
  const [count, setCount] = useState(0);

  // ❌ DON'T: Direct mutation
  // count = count + 1; // This won't work!

  // ✅ DO: Use setter function
  const increment = () => {
    setCount(count + 1);
  };

  // ✅ BETTER: Use functional form when update depends on previous value
  const incrementSafe = () => {
    setCount(prev => prev + 1);
  };

  // Multiple updates in same function
  const incrementByThree = () => {
    // ❌ This only increments by 1 (batching)
    // setCount(count + 1);
    // setCount(count + 1);
    // setCount(count + 1);

    // ✅ This correctly increments by 3
    setCount(prev => prev + 1);
    setCount(prev => prev + 1);
    setCount(prev => prev + 1);
  };

  const decrement = () => {
    setCount(prev => prev - 1);
  };

  const reset = () => {
    setCount(0);
  };

  return (
    <div style={{ padding: '20px', fontFamily: 'Arial' }}>
      <h2>Counter: {count}</h2>
      
      <div style={{ display: 'flex', gap: '10px', marginTop: '20px' }}>
        <button onClick={increment}>
          + 1 (basic)
        </button>
        <button onClick={incrementSafe}>
          + 1 (functional)
        </button>
        <button onClick={incrementByThree}>
          + 3
        </button>
        <button onClick={decrement}>
          - 1
        </button>
        <button onClick={reset}>
          Reset
        </button>
      </div>

      <div style={{ marginTop: '30px', padding: '15px', backgroundColor: '#f0f0f0', borderRadius: '5px' }}>
        <h3>💡 Interview Talking Points:</h3>
        <ul>
          <li>
            <strong>Q: Why use functional form?</strong><br/>
            A: When new state depends on previous state, functional form ensures we use the latest value,
            especially important when multiple updates happen in quick succession.
          </li>
          <li>
            <strong>Q: Is setState synchronous or asynchronous?</strong><br/>
            A: It's asynchronous. React batches updates for performance. In React 18+, all updates are batched,
            including in promises and timeouts.
          </li>
          <li>
            <strong>Q: What happens when state updates?</strong><br/>
            A: Component re-renders with new state value. React reconciles Virtual DOM and updates real DOM efficiently.
          </li>
        </ul>
      </div>
    </div>
  );
}

export default CounterExample;

/**
 * Key Takeaways:
 * 1. useState returns [currentValue, setterFunction]
 * 2. Never mutate state directly - always use setter
 * 3. Use functional form (prev => prev + 1) when new state depends on old
 * 4. State updates are asynchronous and batched
 * 
 * Common Interview Questions:
 * 
 * Q: What's the difference between count + 1 and prev => prev + 1?
 * A: First uses closure (stale value possible), second uses latest value.
 *    When multiple updates happen quickly, functional form is safer.
 * 
 * Q: Can you update state multiple times in one function?
 * A: Yes, but use functional form or updates will be batched incorrectly.
 * 
 * Q: What triggers a re-render?
 * A: setState calls. React compares new state with old (Object.is),
 *    and re-renders if different.
 * 
 * Next Steps:
 * - Try with complex state (objects, arrays)
 * - Experiment with multiple state variables
 * - Combine with useEffect to see render lifecycle
 */
